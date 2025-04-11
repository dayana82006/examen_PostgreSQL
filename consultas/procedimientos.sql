--Un procedimiento almacenado para registrar una venta.

CREATE OR REPLACE PROCEDURE registrar_venta(
    p_cliente_id INT,
    p_producto_id INT,
    p_cantidad INT,
    p_fecha DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock INT;
    v_precio_unitario DOUBLE PRECISION;
    v_precio_total DOUBLE PRECISION;
    v_venta_id INT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE id = p_cliente_id) THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', p_cliente_id;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM producto WHERE id = p_producto_id) THEN
        RAISE EXCEPTION 'El producto con ID % no existe.', p_producto_id;
    END IF;

    SELECT stock, precio INTO v_stock, v_precio_unitario
    FROM producto WHERE id = p_producto_id;

    IF v_stock < p_cantidad THEN
        RAISE NOTICE 'Stock insuficiente. Disponible: % unidades.', v_stock;
        RETURN;
    END IF;

    v_precio_total := p_cantidad * v_precio_unitario;

    INSERT INTO venta(cantidad, precio_total, fecha, producto_id)
    VALUES (p_cantidad, v_precio_total, p_fecha, p_producto_id)
    RETURNING id INTO v_venta_id;

    INSERT INTO cliente_venta(cliente_id, venta_id)
    VALUES (p_cliente_id, v_venta_id);

    UPDATE producto SET stock = stock - p_cantidad WHERE id = p_producto_id;

    RAISE NOTICE 'Venta registrada exitosamente.';
END;
$$;

CALL registrar_venta(1, 2, 1, '2025-04-11');


--Validar que el cliente exista.

CREATE OR REPLACE PROCEDURE ejemplo_validar_cliente(p_cliente_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE id = p_cliente_id) THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', p_cliente_id;
    END IF;

    RAISE NOTICE 'Cliente con ID % verificado.', p_cliente_id;
END;
$$;
CALL ejemplo_validar_cliente(1); 


--Verificar que el stock sea suficiente antes de procesar la venta.
CREATE OR REPLACE PROCEDURE listar_productos_stock_bajo(p_minimo INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Productos con stock menor a %:', p_minimo;
    FOR record IN
        SELECT id, nombre, stock FROM producto WHERE stock < p_minimo
    LOOP
        RAISE NOTICE 'ID: %, Nombre: %, Stock: %', record.id, record.nombre, record.stock;
    END LOOP;
END;
$$;




--Si no hay stock suficiente, Notificar por medio de un mensaje en consola usando RAISE.

--Si hay stock, se realiza el registro de la venta.


