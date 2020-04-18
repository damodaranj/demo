const log = level => (ctx, message) => console.log({ ...ctx, level }, message);

const logger = {
    trace: log("trace"),
    info: log("info"),
    error: log("error")
};

module.exports = logger;
