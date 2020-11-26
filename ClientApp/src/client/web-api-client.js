const getRoles = () => executeGetRequest('api/roles');
const getPagesForRoles = roles => executeGetRequest(`api/Pages/GetByRole?roleNames=${roles.join()}`);
const getProdutsByQuery = queryType => executeGetRequest(`api/Products/GetByQueryType?type=${queryType}`);

async function executeGetRequest(url) {
    const response = await fetch(url);
    const data = await response.json();
    return data;
}

const client = {
    getRoles,
    getPagesForRoles,
    getProdutsByQuery
}

export default client;