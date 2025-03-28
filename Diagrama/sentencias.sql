
CREATE SEQUENCE public.categoria_id_categoria_seq_1;

CREATE TABLE public.Categoria (
                id_categoria BIGINT NOT NULL DEFAULT nextval('public.categoria_id_categoria_seq_1'),
                descripcion VARCHAR NOT NULL,
                CONSTRAINT categoria_pk PRIMARY KEY (id_categoria)
);


ALTER SEQUENCE public.categoria_id_categoria_seq_1 OWNED BY public.Categoria.id_categoria;

CREATE SEQUENCE public.deposito_id_deposito_seq_2;

CREATE TABLE public.Deposito (
                id_deposito BIGINT NOT NULL DEFAULT nextval('public.deposito_id_deposito_seq_2'),
                descripcion VARCHAR NOT NULL,
                CONSTRAINT deposito_pk PRIMARY KEY (id_deposito)
);


ALTER SEQUENCE public.deposito_id_deposito_seq_2 OWNED BY public.Deposito.id_deposito;

CREATE SEQUENCE public.cuotascompras_id_cuota_seq_1;

CREATE TABLE public.CuotasCompras (
                id_cuota BIGINT NOT NULL DEFAULT nextval('public.cuotascompras_id_cuota_seq_1'),
                plazo VARCHAR NOT NULL,
                tipo_cuota INTEGER NOT NULL,
                cantidad_cuotas INTEGER NOT NULL,
                irregular BOOLEAN DEFAULT False NOT NULL,
                CONSTRAINT cuotascompras_pk PRIMARY KEY (id_cuota)
);


ALTER SEQUENCE public.cuotascompras_id_cuota_seq_1 OWNED BY public.CuotasCompras.id_cuota;

CREATE SEQUENCE public.proveedores_id_proveedor_seq_1;

CREATE TABLE public.Proveedores (
                id_proveedor BIGINT NOT NULL DEFAULT nextval('public.proveedores_id_proveedor_seq_1'),
                nombre VARCHAR NOT NULL,
                ruc_ci VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                telefono VARCHAR NOT NULL,
                timbrado_numero VARCHAR NOT NULL,
                fecha_inicio_vigencia DATE NOT NULL,
                fecha_fin_vigencia DATE NOT NULL,
                CONSTRAINT proveedores_pk PRIMARY KEY (id_proveedor)
);


ALTER SEQUENCE public.proveedores_id_proveedor_seq_1 OWNED BY public.Proveedores.id_proveedor;

CREATE SEQUENCE public.productos_id_productos_seq;

CREATE TABLE public.Productos (
                id_productos BIGINT NOT NULL DEFAULT nextval('public.productos_id_productos_seq'),
                descripcion VARCHAR NOT NULL,
                id_categoria BIGINT NOT NULL,
                CONSTRAINT productos_pk PRIMARY KEY (id_productos)
);


ALTER SEQUENCE public.productos_id_productos_seq OWNED BY public.Productos.id_productos;

CREATE SEQUENCE public.productosdetalle_id_producto_detalle_seq_1;

CREATE TABLE public.ProductosDetalle (
                id_producto_detalle BIGINT NOT NULL DEFAULT nextval('public.productosdetalle_id_producto_detalle_seq_1'),
                id_productos BIGINT NOT NULL,
                codigo_barra VARCHAR NOT NULL,
                tamanho VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                iva NUMERIC(2) NOT NULL,
                costo NUMERIC NOT NULL,
                stock_actual INTEGER NOT NULL,
                ultima_fecha_compra DATE NOT NULL,
                precio NUMERIC NOT NULL,
                CONSTRAINT productosdetalle_pk PRIMARY KEY (id_producto_detalle)
);


ALTER SEQUENCE public.productosdetalle_id_producto_detalle_seq_1 OWNED BY public.ProductosDetalle.id_producto_detalle;

CREATE SEQUENCE public.comprasdetalle_id_compras_detalle_seq_1;

CREATE TABLE public.ComprasDetalle (
                id_compras_detalle BIGINT NOT NULL DEFAULT nextval('public.comprasdetalle_id_compras_detalle_seq_1'),
                cantidad INTEGER NOT NULL,
                id_producto_detalle BIGINT NOT NULL,
                precio_unitario NUMERIC NOT NULL,
                CONSTRAINT comprasdetalle_pk PRIMARY KEY (id_compras_detalle)
);


ALTER SEQUENCE public.comprasdetalle_id_compras_detalle_seq_1 OWNED BY public.ComprasDetalle.id_compras_detalle;

CREATE SEQUENCE public.cuotasventas_id_cuota_seq_1;

CREATE TABLE public.CuotasVentas (
                id_cuota BIGINT NOT NULL DEFAULT nextval('public.cuotasventas_id_cuota_seq_1'),
                plazo VARCHAR NOT NULL,
                tipo_cuota INTEGER NOT NULL,
                cantidad_cuotas INTEGER NOT NULL,
                irregular BOOLEAN DEFAULT False NOT NULL,
                CONSTRAINT cuotasventas_pk PRIMARY KEY (id_cuota)
);


ALTER SEQUENCE public.cuotasventas_id_cuota_seq_1 OWNED BY public.CuotasVentas.id_cuota;

CREATE SEQUENCE public.talonarios_id_talonario_seq_1;

CREATE TABLE public.Talonarios (
                id_talonario BIGINT NOT NULL DEFAULT nextval('public.talonarios_id_talonario_seq_1'),
                timbrado VARCHAR NOT NULL,
                fecha_inicio_vigencia DATE NOT NULL,
                fecha_fin_vigencia DATE NOT NULL,
                CONSTRAINT talonarios_pk PRIMARY KEY (id_talonario)
);


ALTER SEQUENCE public.talonarios_id_talonario_seq_1 OWNED BY public.Talonarios.id_talonario;

CREATE SEQUENCE public.clientes_id_cliente_seq_1;

CREATE TABLE public.Clientes (
                id_cliente BIGINT NOT NULL DEFAULT nextval('public.clientes_id_cliente_seq_1'),
                nombre VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                ruc_ci VARCHAR NOT NULL,
                telefono VARCHAR NOT NULL,
                CONSTRAINT clientes_pk PRIMARY KEY (id_cliente)
);


ALTER SEQUENCE public.clientes_id_cliente_seq_1 OWNED BY public.Clientes.id_cliente;

CREATE SEQUENCE public.ventasdetalle_id_ventas_detalle_seq_1;

CREATE TABLE public.VentasDetalle (
                id_ventas_detalle BIGINT NOT NULL DEFAULT nextval('public.ventasdetalle_id_ventas_detalle_seq_1'),
                id_producto_detalle BIGINT NOT NULL,
                cantidad INTEGER NOT NULL,
                precio_unitario NUMERIC NOT NULL,
                CONSTRAINT ventasdetalle_pk PRIMARY KEY (id_ventas_detalle)
);


ALTER SEQUENCE public.ventasdetalle_id_ventas_detalle_seq_1 OWNED BY public.VentasDetalle.id_ventas_detalle;

CREATE SEQUENCE public.monedas_id_moneda_seq_1;

CREATE TABLE public.Monedas (
                id_moneda BIGINT NOT NULL DEFAULT nextval('public.monedas_id_moneda_seq_1'),
                descripcion VARCHAR NOT NULL,
                CONSTRAINT monedas_pk PRIMARY KEY (id_moneda)
);


ALTER SEQUENCE public.monedas_id_moneda_seq_1 OWNED BY public.Monedas.id_moneda;

CREATE SEQUENCE public.tiposdocumentos_id_tipos_documentos_seq_1;

CREATE TABLE public.TiposDocumentos (
                id_tipos_documentos BIGINT NOT NULL DEFAULT nextval('public.tiposdocumentos_id_tipos_documentos_seq_1'),
                descripcion_documento VARCHAR NOT NULL,
                CONSTRAINT tiposdocumentos_pk PRIMARY KEY (id_tipos_documentos)
);


ALTER SEQUENCE public.tiposdocumentos_id_tipos_documentos_seq_1 OWNED BY public.TiposDocumentos.id_tipos_documentos;

CREATE SEQUENCE public.empresa_id_empresa_seq_1;

CREATE TABLE public.Empresa (
                id_empresa BIGINT NOT NULL DEFAULT nextval('public.empresa_id_empresa_seq_1'),
                nombre VARCHAR NOT NULL,
                ruc VARCHAR NOT NULL,
                CONSTRAINT empresa_pk PRIMARY KEY (id_empresa)
);


ALTER SEQUENCE public.empresa_id_empresa_seq_1 OWNED BY public.Empresa.id_empresa;

CREATE SEQUENCE public.compras_id_compras_seq;

CREATE TABLE public.Compras (
                id_compras BIGINT NOT NULL DEFAULT nextval('public.compras_id_compras_seq'),
                id_tipos_documentos BIGINT NOT NULL,
                id_moneda BIGINT NOT NULL,
                id_compras_detalle BIGINT NOT NULL,
                id_empresa BIGINT NOT NULL,
                fecha_proceso TIMESTAMP NOT NULL,
                id_proveedor BIGINT NOT NULL,
                id_cuota BIGINT NOT NULL,
                fecha DATE NOT NULL,
                id_deposito BIGINT NOT NULL,
                documento_numero VARCHAR NOT NULL,
                monto_total NUMERIC NOT NULL,
                CONSTRAINT compras_pk PRIMARY KEY (id_compras)
);


ALTER SEQUENCE public.compras_id_compras_seq OWNED BY public.Compras.id_compras;

CREATE SEQUENCE public.cuentaspagar_id_cuentas_pagar_seq;

CREATE TABLE public.CuentasPagar (
                id_cuentas_pagar BIGINT NOT NULL DEFAULT nextval('public.cuentaspagar_id_cuentas_pagar_seq'),
                vencimiento DATE,
                importe NUMERIC,
                pagado NUMERIC,
                id_cuota BIGINT NOT NULL,
                id_compras BIGINT NOT NULL,
                CONSTRAINT cuentaspagar_pk PRIMARY KEY (id_cuentas_pagar)
);


ALTER SEQUENCE public.cuentaspagar_id_cuentas_pagar_seq OWNED BY public.CuentasPagar.id_cuentas_pagar;

CREATE SEQUENCE public.ventas_id_venta_seq;

CREATE TABLE public.Ventas (
                id_venta BIGINT NOT NULL DEFAULT nextval('public.ventas_id_venta_seq'),
                id_tipos_documentos BIGINT NOT NULL,
                id_moneda BIGINT NOT NULL,
                id_ventas_detalle BIGINT NOT NULL,
                id_empresa BIGINT NOT NULL,
                id_talonario BIGINT NOT NULL,
                id_cuota BIGINT NOT NULL,
                fecha DATE NOT NULL,
                fecha_proceso TIMESTAMP NOT NULL,
                id_deposito BIGINT NOT NULL,
                documento_numero VARCHAR NOT NULL,
                monto_total NUMERIC NOT NULL,
                id_cliente BIGINT NOT NULL,
                CONSTRAINT ventas_pk PRIMARY KEY (id_venta)
);


ALTER SEQUENCE public.ventas_id_venta_seq OWNED BY public.Ventas.id_venta;

CREATE SEQUENCE public.cuentascobrar_id_cuentas_cobrar_seq;

CREATE TABLE public.CuentasCobrar (
                id_cuentas_cobrar BIGINT NOT NULL DEFAULT nextval('public.cuentascobrar_id_cuentas_cobrar_seq'),
                id_venta BIGINT NOT NULL,
                id_cuota BIGINT NOT NULL,
                vencimiento DATE,
                importe NUMERIC,
                cobrado NUMERIC,
                CONSTRAINT cuentascobrar_pk PRIMARY KEY (id_cuentas_cobrar)
);


ALTER SEQUENCE public.cuentascobrar_id_cuentas_cobrar_seq OWNED BY public.CuentasCobrar.id_cuentas_cobrar;

ALTER TABLE public.Productos ADD CONSTRAINT categoria_productos_fk
FOREIGN KEY (id_categoria)
REFERENCES public.Categoria (id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT deposito_compras_fk
FOREIGN KEY (id_deposito)
REFERENCES public.Deposito (id_deposito)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT deposito_ventas_fk
FOREIGN KEY (id_deposito)
REFERENCES public.Deposito (id_deposito)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT cuotascompras_compras_fk
FOREIGN KEY (id_cuota)
REFERENCES public.CuotasCompras (id_cuota)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.CuentasPagar ADD CONSTRAINT cuotascompras_cuentaspagar_fk
FOREIGN KEY (id_cuota)
REFERENCES public.CuotasCompras (id_cuota)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT proveedores_compras_fk
FOREIGN KEY (id_proveedor)
REFERENCES public.Proveedores (id_proveedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ProductosDetalle ADD CONSTRAINT productos_productosdetalle_fk
FOREIGN KEY (id_productos)
REFERENCES public.Productos (id_productos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.VentasDetalle ADD CONSTRAINT productosdetalle_ventasdetalle_fk
FOREIGN KEY (id_producto_detalle)
REFERENCES public.ProductosDetalle (id_producto_detalle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ComprasDetalle ADD CONSTRAINT productosdetalle_comprasdetalle_fk
FOREIGN KEY (id_producto_detalle)
REFERENCES public.ProductosDetalle (id_producto_detalle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT comprasdetalle_compras_fk
FOREIGN KEY (id_compras_detalle)
REFERENCES public.ComprasDetalle (id_compras_detalle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.CuentasCobrar ADD CONSTRAINT cuotas_cuentascobrar_fk
FOREIGN KEY (id_cuota)
REFERENCES public.CuotasVentas (id_cuota)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT cuotasventas_ventas_fk
FOREIGN KEY (id_cuota)
REFERENCES public.CuotasVentas (id_cuota)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT talonarios_ventas_fk
FOREIGN KEY (id_talonario)
REFERENCES public.Talonarios (id_talonario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT clientes_ventas_fk
FOREIGN KEY (id_cliente)
REFERENCES public.Clientes (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT ventasdetalle_ventas_fk
FOREIGN KEY (id_ventas_detalle)
REFERENCES public.VentasDetalle (id_ventas_detalle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT monedas_ventas_fk
FOREIGN KEY (id_moneda)
REFERENCES public.Monedas (id_moneda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT monedas_compras_fk
FOREIGN KEY (id_moneda)
REFERENCES public.Monedas (id_moneda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT tiposdocumentos_ventas_fk
FOREIGN KEY (id_tipos_documentos)
REFERENCES public.TiposDocumentos (id_tipos_documentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT tiposdocumentos_compras_fk
FOREIGN KEY (id_tipos_documentos)
REFERENCES public.TiposDocumentos (id_tipos_documentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ventas ADD CONSTRAINT empresa_ventas_fk
FOREIGN KEY (id_empresa)
REFERENCES public.Empresa (id_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Compras ADD CONSTRAINT empresa_compras_fk
FOREIGN KEY (id_empresa)
REFERENCES public.Empresa (id_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.CuentasPagar ADD CONSTRAINT compras_cuentaspagar_fk
FOREIGN KEY (id_compras)
REFERENCES public.Compras (id_compras)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.CuentasCobrar ADD CONSTRAINT ventas_cuentascobrar_fk
FOREIGN KEY (id_venta)
REFERENCES public.Ventas (id_venta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
