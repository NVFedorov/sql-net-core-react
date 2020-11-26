import React from 'react';
import { Container } from 'reactstrap';

import RolesList from './RolesList'
import PagesList from './PagesList'
import ProductsList from './ProductsList'
import client from '../client/web-api-client'
import { withRouter } from 'react-router-dom';

export default withRouter(function Wrapper({ history }) {
  const [roles, setRoles] = React.useState([]);
  const [pages, setPages] = React.useState([]);
  const [products, setProducts] = React.useState([]);
  const [hash, setHash] = React.useState('');

  let prevHash = undefined;
  React.useEffect(() => {
    client.getRoles().then(data => {
      setRoles(data);
    })
    setHash(history.location.hash);
  }, [])

  React.useEffect(() => {
    if (hash && hash !== prevHash) {
      client.getProdutsByQuery(hash.substring(1)).then(data => {
        if (data && data.length)
          setProducts([...data]);
        else
          setProducts([]);
      });

      prevHash = hash;
    }
  }, [hash])

  const updatePages = async selectedRoles => {
    if (!selectedRoles)
      setPages([]);

    const names = []
    for (let name in selectedRoles)
      if (selectedRoles[name] === true)
        names.push(name);

    if (names.length < 1) {
      setPages([]);
    } else {
      let data = await client.getPagesForRoles(names);
      if (data && data.length)
        setPages([...data]);
    }
  }

  history.listen(location => setHash(location.hash));

  return (
    <>
      <Container>
        <RolesList onRoleUpdated={(selectedRoles) => updatePages(selectedRoles)} roles={roles} />
      </Container>
      {pages.length > 0 &&
        <Container>
          <PagesList pages={pages} />
        </Container>
      }
      {products.length > 0 &&
        <Container>
          <ProductsList items={products} />
        </Container>
      }
    </>
  );
})
