const Logger = require("@ptkdev/logger")

const options = {
    language: "pt",
    type: "log",
    rotate: {
        size: "10M",
        encoding: "utf8",
    },
    write : true,
    path: {
		debug_log: "./app.log",
		error_log: "./errors.log",
	}
}

module.exports = new Logger(options)
