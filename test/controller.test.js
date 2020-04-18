const controller = require("../src/controller");

describe("controller", () => {
    it("returns foo bar", () => {
        const req = {
            url: "/hive"
        };

        const send = jest.fn();

        controller.hive(req, { send });

        expect(send).toBeCalledWith({
            foo: "bar"
        });
    });
});
