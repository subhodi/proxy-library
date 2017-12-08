const Dispatcher = artifacts.require("./Dispatcher.sol");
const DispatcherStorage = artifacts.require("./DispatcherStorage.sol");
const Exchange = artifacts.require("./Exchange.sol");
const ConvertionLib = artifacts.require("./ConvertionLib.sol");
let exchangeInstance;
contract('Exchange', function (accounts) {
    it('Deploying contracts', () => {
        return ConvertionLib.new().then(instance => {
            return DispatcherStorage.new(instance.address);
        }).then(instance => {
            return Dispatcher.new(instance.address);
        }).then(instance => {
            return Exchange.new(instance.address);
        }).then(instance => {
            exchangeInstance = instance;
            assert.notEqual(null, instance.address, "Deployment failed");
        })
    });

    it('toINR conversrion', () => {
        exchangeInstance.setRate(11).then(tx => {
            return exchangeInstance.rate();
        }).then(value => {
            console.log(value.valueOf());
        }).catch(err => {
            console.log(err);
        })
    });
});