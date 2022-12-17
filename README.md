Demonstrates issue with Prisma generating migration that is incompatible with CRDB. Related ticket: https://support.cockroachlabs.com/hc/en-us/requests/14983?page=1

# Setup

1. `npm install`
1. Have CRDB v22.2 running on port 26257
1. `npx prisma migrate dev`
1. `npx prisma migrate reset`
1. 💥

Should get this error:

```
Error: P3016

The fallback method for database resets failed, meaning Migrate could not clean up the database entirely. Original error:
db error: ERROR: "Message" is referenced by foreign key from table "MessageLikedUser"
   0: sql_migration_connector::best_effort_reset
             at migration-engine/connectors/sql-migration-connector/src/lib.rs:290
   1: migration_core::state::Reset
             at migration-engine/core/src/state.rs:341
```

Then change to running v22.1.11 with a fresh DB. Run `npx prisma migrate dev` and `npx prisma migrate reset` and now it'll work.
