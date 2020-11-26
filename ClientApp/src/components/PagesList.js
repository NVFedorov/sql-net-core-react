import React from 'react'
import { withRouter } from 'react-router-dom'

function PagesList(props) {
    const { onItemClick, pages, history } = props;
    const itemClicked = (name, url) => {
        history.push(url);
    }

    return (
        <div className="container" style={{marginTop: '10px'}}>
            {pages.map(p =>
                <button 
                    key={p.url} 
                    className="btn btn-primary"
                    style={{ margin: '5px' }}
                    onClick={() => itemClicked(p.name, p.url)}>{p.text}</button>
            )}
        </div>
    )
}

export default withRouter(PagesList);