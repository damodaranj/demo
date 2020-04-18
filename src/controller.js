const logger = require("./logger");

const hive = (req, res) => {
    logger.trace({ url: req.url }, "Controller started");

    res.send({
        foo: "bar"
    });

    logger.trace({ url: req.url }, "Controller complete");
};

const healthcheck = (req, res) => {
    if (Math.random() > 0.995) {
        return res.send({
            status: "down",
            reason: "The odds are not with you"
        });
    }

    res.send({
        status: "up",
        uptime: process.uptime()
    });
};

module.exports = { hive, healthcheck };
