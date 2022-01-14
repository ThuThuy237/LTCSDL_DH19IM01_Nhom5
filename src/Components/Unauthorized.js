import React from 'react';
import myStyles from '../Styles/Unauthorized.module.scss';
import { Link } from 'react-router-dom';

export default function Unauthorized() {
    return (
        <div className={myStyles.body}>
            <div className={myStyles.ghost}>
                <div className={myStyles.noti}>
                    <div className={myStyles.stick} />
                    <div className={myStyles.contentNoti}>
                        You are not authorized, please login now
                    </div>
                </div>

                <div className={myStyles.ghostNavbar}></div>
                <div className={myStyles.ghostColumns}>
                    <div className={myStyles.ghostColumn}>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                    </div>
                    <div className={myStyles.ghostColumn}>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                    </div>
                    <div className={myStyles.ghostColumn}>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                        <div className={myStyles.code}></div>
                    </div>

                </div>
                <div className={myStyles.ghostMain}>
                    <div className={myStyles.code}></div>
                    <div className={myStyles.code}></div>
                    <div className={myStyles.text}><Link to='/'><span>Go Home</span></Link></div>
                    <div className={myStyles.text}><Link to='/login'><span>Go To Login</span></Link></div>
                </div>

            </div>

            <h1 className={`${myStyles.policeTape} ${myStyles.policeTape1}`}>
                &nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: 401
            </h1>
            <h1 className={`${myStyles.policeTape} ${myStyles.policeTape2}`}>Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unauthorized&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>


        </div>
    )
}
