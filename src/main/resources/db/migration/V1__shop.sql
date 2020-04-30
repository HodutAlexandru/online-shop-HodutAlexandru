drop table if exists customers;
drop table if exists customers_orders;
drop table if exists locations;
drop table if exists locations_revenues;
drop table if exists locations_stocks;
drop table if exists order_details;
drop table if exists order_location;
drop table if exists orders;
drop table if exists orders_order_details;
drop table if exists product_categories;
drop table if exists product_categories_products;
drop table if exists products;
drop table if exists revenues;
drop table if exists stocks;
drop table if exists suppliers;
drop table if exists suppliers_products;
create table customers (id integer generated by default as identity, email varchar(255) not null, first_name varchar(255) not null, last_name varchar(255) not null, password varchar(255) not null, username varchar(255)
not null, primary key (id));
create table customers_orders (customer_id integer not null, orders_id integer not null);
create table locations (id integer generated by default as identity, city varchar(255) not null, country varchar(255) not null, name varchar(255) not null, street varchar(255) not null, primary key (id));
create table locations_revenues (location_id integer not null, revenues_id integer not null);
create table locations_stocks (location_id integer not null, stocks_id integer not null);
create table order_details (id integer generated by default as identity, quantity integer not null, order_id integer, product_id integer, primary key (id));
create table order_location (order_id integer not null, location_id integer not null, primary key (order_id, location_id));
create table orders (id integer generated by default as identity, customer_id integer, primary key (id));
create table orders_order_details (order_id integer not null, order_details_id integer not null);
create table product_categories (id integer generated by default as identity, description varchar(255) not null, name varchar(255) not null, primary key (id));
create table product_categories_products (product_category_id integer not null, products_id integer not null);
create table products (id integer generated by default as identity, description varchar(255) not null, image_url varchar(255), name varchar(255) not null, price decimal(19,2) not null, weight double not null, category_id
integer, supplier_id integer, primary key (id));
create table revenues (id integer generated by default as identity, date date not null, sum decimal(19,2) not null, location_id integer, primary key (id));
create table stocks (id integer generated by default as identity, quantity integer not null, location_id integer, product_id integer, primary key (id));
create table suppliers (id integer generated by default as identity, name varchar(255) not null, primary key (id));
create table suppliers_products (supplier_id integer not null, products_id integer not null);
alter table customers_orders add constraint UK_c23uaum5y9y2r1f0a3jprvu19 unique (orders_id);
alter table locations_revenues add constraint UK_s0mbgckw3o43rl1yuqfr0ll71 unique (revenues_id);
alter table locations_stocks add constraint UK_9xbrglc1oc6qbfy2kxf09jga5 unique (stocks_id);
alter table orders_order_details add constraint UK_22wlf6q0mc7mkuqp7bvm3dm2d unique (order_details_id);
alter table product_categories_products add constraint UK_jpn0jrn5qdpr0yaceodxr423f unique (products_id);
alter table suppliers_products add constraint UK_3h6w2cs5uu8u8diqnlmqgow03 unique (products_id);
alter table customers_orders add constraint FKcgubpw142krbvsbpfumpss2wl foreign key (orders_id) references orders;
alter table customers_orders add constraint FK23d13l73po2yhpnru16evw5o3 foreign key (customer_id) references customers;
alter table locations_revenues add constraint FKkcqj5ks4pclwdypw9dfm8pq2e foreign key (revenues_id) references revenues;
alter table locations_revenues add constraint FKgg1l9jwou2bsgxhrpl97593e1 foreign key (location_id) references locations;
alter table locations_stocks add constraint FKrddbqseuw3jhgy40jkd760ibf foreign key (stocks_id) references stocks;
alter table locations_stocks add constraint FKq8guryaf7p2956oi31hme0kwu foreign key (location_id) references locations;
alter table order_details add constraint FKjyu2qbqt8gnvno9oe9j2s2ldk foreign key (order_id) references orders;
alter table order_details add constraint FK4q98utpd73imf4yhttm3w0eax foreign key (product_id) references products;
alter table order_location add constraint FKj7yurleamivl2gt84klrqllqh foreign key (location_id) references locations;
alter table order_location add constraint FK60at1ha7qkne9kquulx06xoex foreign key (order_id) references orders;
alter table orders add constraint FKpxtb8awmi0dk6smoh2vp1litg foreign key (customer_id) references customers;
alter table orders_order_details add constraint FK5tqkl4l12ncaw7q7ua2gc4a3w foreign key (order_details_id) references order_details;
alter table orders_order_details add constraint FK95iwi9c75iprmwbnr63vq4863 foreign key (order_id) references orders;
alter table product_categories_products add constraint FKjoqtlg0128k0fdkphpepydxp4 foreign key (products_id) references products;
alter table product_categories_products add constraint FKp1c27x9dhtidt4mmodixnxnx3 foreign key (product_category_id) references product_categories;
alter table products add constraint FK6t5dtw6tyo83ywljwohuc6g7k foreign key (category_id) references product_categories;
alter table products add constraint FK6i174ixi9087gcvvut45em7fd foreign key (supplier_id) references suppliers;
alter table revenues add constraint FKer2y52whnfjrycs7l8bqk7c67 foreign key (location_id) references locations;
alter table stocks add constraint FK2gb4265ojat2vxgjk2td79n0 foreign key (location_id) references locations;
alter table stocks add constraint FKff7be959jyco0iukc1dcjj9qm foreign key (product_id) references products;
alter table suppliers_products add constraint FKl2ny02g9d0u0m6lqabfb9o7t0 foreign key (products_id) references products;
alter table suppliers_products add constraint FKdpy1wg96qkljeo1xh1cox05r9 foreign key (supplier_id) references suppliers;