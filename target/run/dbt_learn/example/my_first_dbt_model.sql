

  create view "dbt_alex"."my_first_dbt_model__dbt_tmp" as (
    -- Welcome to your first dbt model!
-- Did you know that you can also configure models directly within
-- the SQL file? This will override configurations stated in dbt_project.yml

-- Try changing 'view' to 'table', then re-running dbt



select 1 as id
  ) ;