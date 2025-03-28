const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { Pool } = require('pg');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.static(__dirname));


// Conexión a PostgreSQL
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'ventasApp',
  password: 'postgres',
  port: 5432,
});

// Endpoint para obtener todas las compras
app.get('/compras', async (req, res) => {
    try {
        const result = await pool.query( `SELECT 
            c.id_compras, 
            t.descripcion_documento, 
            m.descripcion, 
            p.ruc_ci, 
            TO_CHAR(c.fecha, 'YYYY-MM-DD') AS fecha,  
            c.monto_total
        FROM compras c
        JOIN tiposdocumentos t ON c.id_tipos_documentos = t.id_tipos_documentos
        JOIN monedas m ON m.id_moneda = c.id_moneda
        JOIN proveedores p ON p.id_proveedor = c.id_proveedor`);
        res.json(result.rows);
    } catch (error) {
        console.error('Error al obtener las compras:', error);
        res.status(500).json({ error: 'Error al obtener las compras' });
    }
});

// Endpoint para obtener todas las ventas
app.get('/ventas', async (req, res) => {
    try {
        const result = await pool.query( `SELECT 
            c.id_venta, 
            t.descripcion_documento, 
            m.descripcion, 
            p.ruc_ci, 
            TO_CHAR(c.fecha, 'YYYY-MM-DD') AS fecha, 
            c.monto_total
        FROM ventas c
        JOIN tiposdocumentos t ON c.id_tipos_documentos = t.id_tipos_documentos
        JOIN monedas m ON m.id_moneda = c.id_moneda
        JOIN clientes p ON p.id_cliente = c.id_cliente`);
        res.json(result.rows);
    } catch (error) {
        console.error('Error al obtener las compras:', error);
        res.status(500).json({ error: 'Error al obtener las compras' });
    }
});


// Endpoint para obtener las facturas
app.get('/facturas', async (req, res) => {
  try {
    const result = await pool.query('SELECT id_compras, factura_numero FROM Compras');
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint para guardar la información de las cuotas
app.post('/guardar-cuotas', async (req, res) => {
  const { plazo, cantidad_cuotas, irregular, dias } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO CuotasCompras (plazo, tipo_cuota, cantidad_cuotas, irregular) 
       VALUES ($1, 1, $2, $3) RETURNING id_cuota`,
      [plazo, cantidad_cuotas, irregular]
    );
    const id_cuota = result.rows[0].id_cuota;

    if (irregular && dias.length > 0) {
      for (let dia of dias) {
        await pool.query(
          `INSERT INTO CuotasDetalleCompras (dias, id_cuota) VALUES ($1, $2)`,
          [dia, id_cuota]
        );
      }
    }
    res.json({ message: 'Cuotas guardadas correctamente' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Servidor en ejecución en http://localhost:${port}`);
});

