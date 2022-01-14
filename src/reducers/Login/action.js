import { http } from "../../api/http";
import { http_auth } from "../../api/http_auth";
import * as Type from './type';
import cookies from 'react-cookies';
import {Noti} from "../../Components/Noti";
const grant_type = 'password';
const client_id = 'rkIEIks89aJKch3vGO4JSwDWDwxgWK6l6MsQodwi';
const client_secret = 'tZnJ8hN76t6CQFI3lB1oRCw3Zgoyf3gFMWw4qqHscI8LWhlZGZHdFn8U2qXDa9l9qlOgjLXDoUrIa8moDzyiBXlEeGMnjKyIrhH9yIpmj7DHvmK8id2KsjZKFDi7hjK8';
export const getUserLogin = (history) => {
    return (dispatch) => {
        dispatch(actionLoginRequest());
        http_auth.get('user/current-user/').then((rs) => {
            dispatch(actionLoginSuccess(rs.data));
        }).catch((err) => {
            // if (history) {
            //     dispatch(actionLoginFailed({'login sesion':"The login session has expired, please login again"}));
            //     // history.push('/login')
            // }
            // else {
                dispatch(actionLoginFailed({"err":"error"}));
                // Noti("Login failed", "The login session has expired, please login again", "error");
            // }
        });
    }
}
export const actLogin = (user, history) => {
    return async (dispatch) => {
        dispatch(actionLoginRequest());
        let data = {
            ...user,
            grant_type: grant_type,
            client_id: client_id,
            client_secret: client_secret
        }
        await http.post('o/token/', data).then((rs) => {
            cookies.save('access_token', rs.data.access_token, { path: '/' });
            // getUserLogin(history);
            history.goBack();
        }).catch((err) => {
            dispatch(actionLoginFailed({'Account info': 'Incorrect username or password'}));
            Noti('Account info', 'Incorrect username or password', "error");
        })
    }
}
export const actChangeInfo = (user) => {
    return async (dispatch) => {
        dispatch(actionChangeInfoRequest());
        await http_auth.patch(`user/change-info/`, user).then((rs) => {
           dispatch(actionChangeInfoSuccess(rs));
           Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
        }).catch((err) => {
            dispatch(actionChangeInfoFailed({'Account info': 'Incorrect username or password'}));
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
            // console.log(err)
        })
        dispatch(actionLoginRequest());
        await http_auth.get('user/current-user/').then((rs) => {
            dispatch(actionLoginSuccess(rs.data));
        }).catch((err) => {
                dispatch(actionLoginFailed({"err":"error"}));
        });
    }
}

export const actChangeAvatar = (user) => {
    return async (dispatch) => {
        dispatch(actionChangeInfoRequest());
        await http_auth.patch(`user/change-ava/`, user).then((rs) => {
           dispatch(actionChangeInfoSuccess(rs));
           Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
        dispatch(actionLoginRequest());
        await http_auth.get('user/current-user/').then((rs) => {
            dispatch(actionLoginSuccess(rs.data));
        }).catch((err) => {
                dispatch(actionLoginFailed({"err":"error"}));
        });
    }
}

export const actUploadCv = (data) => {
    return async (dispatch) => {
        await http_auth.patch(`job-appliant/upload-cv/`, data).then((rs) => {
           Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
           dispatch(getUserLogin())
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}

export const actUploadCoverLetter = (data) => {
    return async (dispatch) => {
        await http_auth.patch(`job-appliant/upload-cover-letter/`, data).then((rs) => {
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
            dispatch(getUserLogin());
         }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
         })
    }
}
export const actRegister = (user, history) => {
    return async (dispatch) => {
        dispatch(actionLoginRequest());
        await http.post('user/', user).then((rs) => {
            let data = {
                username: user.username,
                password: user.password
            }
            dispatch( actLogin(data, history));
        }).catch((err) => {
            Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            dispatch(actionLoginFailed(err.response));
        })
    }
}


export const actLoginGG = (accessToken, history, mess) => {
    return async (dispatch) => {
        dispatch(actionLoginRequest());
        await http.post('/auth/convert-token/', {
            token: accessToken,
            backend: 'google-oauth2',
            grant_type: 'convert_token',
            client_id: client_id,
            client_secret: client_secret

        }).then((rs) => {
            // console.log(rs)
            cookies.save('access_token', rs.data.access_token, { path: '/' });
            history.goBack();
        }).catch((err) => {
            console.log(err)
        })
    }
}
const actionLoginRequest = () => {
    return {
        type: Type.LOGIN_REQUEST
    }
}
const actionLoginSuccess = (data) => {
    return {
        type: Type.LOGIN_SUCCESS,
        data: data
    }
}
const actionLoginFailed = (err) => {
    return {
        type: Type.LOGIN_FAILED,
        data: err
    }
}
const actionChangeInfoRequest = () => {
    return {
        type: Type.CHANGE_INFO_REQUEST
    }
}
const actionChangeInfoSuccess = (data) => {
    return {
        type: Type.CHANGE_INFO_SUCCESS,
        data: data
    }
}
const actionChangeInfoFailed = (err) => {
    return {
        type: Type.CHANGE_INFO_FAILED,
        data: err
    }
}
export const actLogout = () => {
    cookies.remove('access_token');
    cookies.remove('access_token', { path: '/' })
    return {
        type: Type.LOGOUT,
    }
}
export const changePw = (data) => {
    return (dispatch) => {
        http_auth.post(`user/change-password/`,data).then((rs) => {
            Noti(Object.keys(rs.data)[0], rs.data[Object.keys(rs.data)[0]], "success");
            // dispatch(getUserLogin());
        }).catch((err) => {
            if(err.response){
                Noti(Object.keys(err.response.data)[0], err.response.data[Object.keys(err.response.data)[0]], "error");
            }
        })
    }
}