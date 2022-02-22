{{ config(materialized='view') }}
select * from {{ source('staging', 'fhv_non_partitoned') }}

-- Allows us to run the model with limit 100 or without limit 100
{% if var('is_test_run', default = false) %}
limit 100
{% endif %}