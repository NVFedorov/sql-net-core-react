import React from 'react'

function ProductsList(props) {
    const { items } = props;

    return (
        <div className="container" style={{ marginTop: '10px' }}>
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Cost</th>
                        <th>Purchases</th>
                    </tr>
                </thead>
                <tbody>
                    {items.map(item =>
                        <tr key={item.id}>
                            <td>{item.id}</td>
                            <td>{item.name}</td>
                            <td>{item.cost}</td>
                            <td>{item.purchases}</td>
                        </tr>
                    )}
                </tbody>
            </table>
        </div>
    )
}

export default ProductsList;