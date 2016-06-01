#!/bin/bash

#clear

echo "This script will generate the model"

bin/rails d scaffold product
bin/rails d model impact_line_item
bin/rails d model product_impact_line_item
bin/rails d model category name
bin/rails d model impact_entry

bin/rails g scaffold product name parent_product_id:integer user:references
bin/rails g model impact_line_item name
bin/rails g model product_impact_line_item product:references impact_line_item:references
bin/rails g model category name
bin/rails g model impact_entry value:float unit:string product_impact_line_item:references category:references

echo "Don't forget to update product.rb with the associations"
