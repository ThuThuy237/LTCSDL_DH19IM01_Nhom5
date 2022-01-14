import React, { useEffect } from 'react';
import { Route } from 'react-router';
import RecruiterLayout from '../Layouts/RecruiterLayout';
import { getUserLogin } from '../reducers/Login/action';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";
import Unauthorized from '../Components/Unauthorized';
import Loading from '../Components/Loading';

export default function UserTemplate({ Component, ...props }) {
  let history = useHistory();
  const dispatch = useDispatch();
  const { loading, userLogin, err } = useSelector(state => state.LoginReducer);

  useEffect(() => {
    dispatch(getUserLogin(history));
  }, [dispatch, history]);

  const renderPage = React.useCallback(() => {
    if (loading) { return <Loading /> }
    if (err) { return <Unauthorized /> }
    if (userLogin !== null) {
      return <>
        <Route {...props}
          render={(propsComponent) => (
            <RecruiterLayout>
              <Component {...propsComponent} />
            </RecruiterLayout>
          )}
        />
      </>
    }
  }, [userLogin, loading, err, props]);
  return (
    <>{renderPage()}</>
  )
}
