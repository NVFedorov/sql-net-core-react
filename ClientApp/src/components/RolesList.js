import React from 'react'

function RolesList({ onRoleUpdated, roles }) {
    const [selectedRoles, setSelectedRoles] = React.useState({});

    React.useEffect(() => {
        let selected = {};
        for (let i in roles)
            selected[roles[i].name] = false;

        setSelectedRoles(selected);
    }, [roles])

    const updateRoles = (name, checked) => {
        const updatedRoles = {            
            ...selectedRoles,
            [name]: checked === true
        }

        setSelectedRoles(updatedRoles);

        onRoleUpdated({
            ...updatedRoles
        });
    }

    return (
        <div className="container">
            {roles.map(r =>
                <div className="form-check" key={r.name}>
                    <input
                        type="checkbox"
                        className="form-check-input"
                        checked={selectedRoles[r.name] === true}
                        onChange={e => updateRoles(r.name, selectedRoles[r.name] !== true)} />
                    <label className="form-check-label">{r.name}</label>
                </div>
            )}
        </div>
    )
}

export default RolesList;