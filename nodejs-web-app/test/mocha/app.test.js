// test/app.test.js

const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('../../'); // Import your Express app

chai.use(chaiHttp);
const expect = chai.expect;

describe('Node.js Web App', () => {
  it('should return "Hello from Node.js Web App!" on /mynode GET', (done) => {
    chai
      .request(app)
      .get('/mynode')
      .end((err, res) => {
        expect(res).to.have.status(200);
        expect(res.text).to.equal('Hello from Node.js Web App at /mynode!');
        done();
      });
  });
});