import React from 'react';
import Footer from '../Components/Footer';
import MyHeader from '../Components/MyHeader';

export default function LayoutHome({children}) {
    return (
        <>
            <MyHeader/>
            {children}
            <Footer/>
        </>
    )
}
