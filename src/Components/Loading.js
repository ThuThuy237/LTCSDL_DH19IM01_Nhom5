import React from 'react';
import myStyles from '../Styles/Loading.module.scss'

export default function Loading() {
    return (
        <div className={myStyles.container}>
            <div className={myStyles.loader}>
                <div className={myStyles.dot}></div>
                <div className={myStyles.dot}></div>
                <div className={myStyles.dot}></div>
                <div className={myStyles.dot}></div>
                <div className={myStyles.dot}></div>
                <div className={myStyles.dot}></div>
                <div className={myStyles.text}></div>
            </div>
        </div>
    )
}
