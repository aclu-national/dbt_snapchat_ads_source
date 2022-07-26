# dbt_snapchat_ads_source v0.4.0
PR [#13](https://github.com/fivetran/dbt_snapchat_ads_source/pull/13) applies the Ad Reporting V2 updates:
## 🎉 Feature Enhancements 🎉
- Adds the `ad_squad_hourly_report` and `campaign_hourly_report` source tables and accompanying staging models
- Adds the field descriptions and grain uniqueness tests for the new models 
- Adds additional fields to existing models 
- Applies README standardization updates
- Introduces the identifier variable for all source models
- Casts all timestamp fields using dbt_utils.type_timestamp()
- Introduces metric passthrough capability

## 🚨 Breaking Changes 🚨
- Changes `snapchat_schema` and `snapchat_database` variable names to `snapchat_ads_schema` and `snapchat_ads_database` 
- Updates model names to prefix with `snapchat_ads`

# dbt_snapchat_ads_source v0.3.1
## Bug Fixes
- Includes `updated_at` in uniqueness tests on `stg_snapchat__creative_url_tag_history`. This was originally missing, causing erroneous uniqueness test failures on this history table ([#10](https://github.com/fivetran/dbt_snapchat_ads_source/issues/10)).

# dbt_snapchat_ads_source v0.3.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_snapchat_ads_source v0.1.0 -> v0.2.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
