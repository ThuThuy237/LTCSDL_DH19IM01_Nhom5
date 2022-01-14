import * as Type from './type';
let initialState = {
    loading: true,
    listCategory: null,
    listLocation: null,
    listTag: null,
    err: null,
}
const GetResourseReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.GETCATEGORY_REQUEST: {
            state.loading = true;
            state.listCategory = null;
            state.err = null;
            return {...state}
        }
        case Type.GETCATEGORY_SUCCESS:{
            state.loading = false;
            state.listCategory = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETCATEGORY_FAILED:{
            state.loading = false;
            state.listCategory = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETLOCATION_REQUEST: {
            state.loading = true;
            state.listLocation = null;
            state.err = null;
            return {...state}
        }
        case Type.GETLOCATION_SUCCESS:{
            state.loading = false;
            state.listLocation = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETLOCATION_FAILED:{
            state.loading = false;
            state.listLocation = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETTAG_REQUEST: {
            state.loading = true;
            state.listTag = null;
            state.err = null;
            return {...state}
        }
        case Type.GETTAG_SUCCESS:{
            state.loading = false;
            state.listTag = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETTAG_FAILED:{
            state.loading = false;
            state.listTag = null;
            state.err = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default GetResourseReducer;