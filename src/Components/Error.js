import React, { useState } from 'react';
import myStyles from '../Styles/Error.module.scss';
import { Link } from 'react-router-dom';

export default function Error() {
    const [MousePosition, setMousePosition] = useState({
        left: 0,
        top: 0
    })
    const [rot,setRot] = useState(null)
    function handleMouseMove(ev) { 
        setMousePosition({left: ev.pageX, top: ev.pageY});
        let rad = Math.atan2(MousePosition.left - 701, MousePosition.top - 143);
        let r = (rad * (180 / Math.PI) * -1) + 180;
        setRot(r);
    }
    return (
        <div className={myStyles.fullScreen} onMouseMove={(ev)=> handleMouseMove(ev)}>
            <div className={myStyles.container}>
                <div className={myStyles.flex}>
                    <span className={myStyles.errorNum}>5</span>
                    <div style={{
                        'WebkitTransform': 'rotate(' + rot + 'deg)',
                        'MozTransform': 'rotate(' + rot + 'deg)',
                        'msTransform': 'rotate(' + rot + 'deg)',
                        'transform': 'rotate(' + rot + 'deg)'
                    }} className={myStyles.eye}></div>
                    <div style={{
                        'WebkitTransform': 'rotate(' + rot + 'deg)',
                        'MozTransform': 'rotate(' + rot + 'deg)',
                        'msTransform': 'rotate(' + rot + 'deg)',
                        'transform': 'rotate(' + rot + 'deg)'
                    }} className={myStyles.eye}></div>
                </div>
                <p className={myStyles.subText}>Oh eyeballs! Something went wrong. We're <span className={myStyles.italic}>looking</span> to see what happened.</p>
                <Link to='/'>Go back</Link>
            </div>
        </div>
    )
}