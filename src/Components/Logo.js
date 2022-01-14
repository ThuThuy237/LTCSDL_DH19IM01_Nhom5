import React from 'react';
import tt from '../Assets/Images/tt.png';
import { NavLink } from 'react-router-dom';


export default function Logo() {
    return (
        <div>
            <NavLink to="/">
                <img style={{ width: `100%` }} alt="logo" src={tt} />
            </NavLink >
        </div>
    )
}
