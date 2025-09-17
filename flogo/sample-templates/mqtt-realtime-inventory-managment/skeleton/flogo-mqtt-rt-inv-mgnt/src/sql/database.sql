CREATE TABLE items (
    item_id VARCHAR(255) PRIMARY KEY, -- Unique identifier for the item (e.g., "TSHIRT-001")
    item_name VARCHAR(255) NOT NULL,    -- Descriptive name of the item
    description TEXT,                   -- Optional, detailed description
    CONSTRAINT unique_item_id UNIQUE (item_id)
);

CREATE TABLE stores (
    store_id VARCHAR(255) PRIMARY KEY,  -- Unique identifier for the store (e.g., "london")
    store_name VARCHAR(255) NOT NULL,    -- Name of the store
    location VARCHAR(255),               -- Location of the store
    CONSTRAINT unique_store_id UNIQUE (store_id)
);

CREATE TABLE inventory (
    item_id VARCHAR(255) REFERENCES items (item_id),
    store_id VARCHAR(255) REFERENCES stores (store_id),
    stock_level INT NOT NULL DEFAULT 0, -- Current stock quantity
    low_stock_threshold INT NOT NULL DEFAULT 5, -- Threshold for low stock alerts
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (item_id, store_id),      -- Composite primary key
    CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES items (item_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores (store_id),
    CONSTRAINT positive_stock_level CHECK (stock_level >= 0),
    CONSTRAINT positive_low_stock CHECK (low_stock_threshold >= 0)
);

CREATE TABLE inventory_log (
    log_id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    item_id VARCHAR(255) REFERENCES items (item_id),
    store_id VARCHAR(255) REFERENCES stores (store_id),
    quantity_change INT NOT NULL,
    event_type VARCHAR(10) NOT NULL,       -- 'sales' or 'restock'
    event_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    new_stock_level INT NOT NULL,
    CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES items (item_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores (store_id),
    CONSTRAINT valid_event_type CHECK (event_type IN ('sales', 'restock'))
);


-- Sample data for all the tables

-- Insert data into the items table
INSERT INTO items (item_id, item_name, description) VALUES
('TSHIRT-001', 'T-Shirt', 'Classic cotton t-shirt, available in various colors'),
('JEANS-002', 'Jeans', 'Blue denim jeans, straight fit'),
('SNEAKERS-003', 'Sneakers', 'Sports sneakers, for running and casual wear'),
('HAT-004', 'Hat', 'Baseball cap, adjustable strap'),
('SCARF-005', 'Scarf', 'Wool scarf, warm and soft');

-- Insert data into the stores table
INSERT INTO stores (store_id, store_name, location) VALUES
('london', 'London Store', 'London'),
('munich', 'Munich Store', 'Munich'),
('paris', 'Paris Store', 'Paris'),
('berlin', 'Berlin Store', 'Berlin');

-- Insert data into the inventory table
INSERT INTO inventory (item_id, store_id, stock_level, low_stock_threshold, last_updated) VALUES
('TSHIRT-001', 'london', 50, 10, '2024-07-24 10:00:00+00'),
('TSHIRT-001', 'munich', 30, 5, '2024-07-24 10:00:00+00'),
('JEANS-002', 'london', 20, 5, '2024-07-24 10:00:00+00'),
('JEANS-002', 'paris', 40, 10, '2024-07-24 10:00:00+00'),
('SNEAKERS-003', 'berlin', 15, 3, '2024-07-24 10:00:00+00'),
('HAT-004', 'london', 100, 20, '2024-07-24 10:00:00+00'),
('SCARF-005', 'munich', 25, 5, '2024-07-24 10:00:00+00');

-- Insert data into the inventory_log table
INSERT INTO inventory_log (log_id, event_id, item_id, store_id, quantity_change, event_type, event_timestamp, new_stock_level) VALUES
(1, 'a1b2c3d4-e5f6-7890-1234-567890a', 'TSHIRT-001', 'london', -2, 'sales', '2024-07-24 09:55:00+00', 48),
(2, '98765432-10fe-dcba-9876-543210fed', 'JEANS-002', 'paris', 1, 'restock', '2024-07-24 09:58:00+00', 41),
(3, 'abcdef01-2345-6789-0abc-def012345', 'SNEAKERS-003', 'berlin', -1, 'sales', '2024-07-24 10:05:00+00', 14);



-- Create a function that sends a notification
CREATE OR REPLACE FUNCTION notify_low_stock()
RETURNS TRIGGER AS $$
DECLARE
  payload JSON;
BEGIN
  IF NEW.stock_level < NEW.low_stock_threshold THEN
    -- Construct the payload with relevant information
    payload := json_build_object(
      'item_id', NEW.item_id,
      'store_id', NEW.store_id,
      'stock_level', NEW.stock_level,
      'low_stock_threshold', NEW.low_stock_threshold
    );

    -- Send the notification on the 'low_stock' channel
    PERFORM pg_notify('low_stock', payload::text);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that calls the function after an update on the inventory table
CREATE TRIGGER inventory_low_stock_trigger
AFTER UPDATE ON inventory
FOR EACH ROW
WHEN (NEW.stock_level < NEW.low_stock_threshold)
EXECUTE FUNCTION notify_low_stock();