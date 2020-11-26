import React from 'react';
import { Route } from 'react-router';
import { Layout } from './components/Layout';
import Wrapper from './components/Wrapper';

import './custom.css'

function App() {

  return (
    <Layout>
      <Route exact path='/' component={Wrapper} />
    </Layout>
  );
}

export default App;