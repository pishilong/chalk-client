# Tests sit right alongside the file they are testing, which is more intuitive
# and portable than separating `src` and `test` directories. Additionally, the
# build process will exclude all `.spec.js` files from the build
# automatically.

describe 'home section', () ->
  beforeEach(module('ngChalk.home'))

  it 'should have a dummy test', inject( () ->
    expect(true).toBeTruthy()
  )
