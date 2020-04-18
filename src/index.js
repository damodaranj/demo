const express = require("express");
const dotenv = require("dotenv");
const controller = require("./controller");
const logger = require("./logger");

dotenv.load();

const app = express();

app.get("/hive", controller.hive);

app.get("/healthcheck", controller.healthcheck);

app.listen(process.env.PORT, () => {
    logger.info({ port: process.env.PORT }, "App listening");
});
