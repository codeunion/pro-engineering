--- Tables
--- items (Item)
--- pictures (Picture)
--- item_requests (ItemRequest)
--- item_requests_items (ItemRequestsItem)

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE item_requests (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    message TEXT,
);

CREATE TABLE item_requests_items (
    id SERIAL PRIMARY KEY,
    item_request_id INT NOT NULL,
    item_id INT NOT NULL
);

ADD UNIQUE INDEX item_request_item_index
ON item_requests_items (item_request_id, item_id);
