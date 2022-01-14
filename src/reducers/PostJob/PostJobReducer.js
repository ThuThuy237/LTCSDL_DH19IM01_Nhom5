import * as Type from './type';
let initialState = {
    loading: true,
    listPost: null,
    topPost: null,
    postDetail: null,
    postOwner: null,
    listApplicants: null,
    currentPage: 1,
    err: null,
}
const PostJobReducer = (state = initialState, action) => {
    switch (action.type) {
        case Type.GETPOST_REQUEST: {
            state.loading = true;
            state.listPost = null;
            state.err = null;
            return {...state}
        }
        case Type.GETTOPPOST_REQUEST: {
            state.loading = true;
            state.topPost = null;
            state.err = null;
            return {...state}
        }
        case Type.GETPOST_SUCCESS:{
            state.loading = false;
            state.listPost = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETTOPPOST_SUCCESS:{
            state.loading = false;
            state.topPost = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETPOST_FAILED:{
            state.loading = false;
            state.listPost = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETTOPPOST_FAILED:{
            state.loading = false;
            state.topPost = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETDETAIL_REQUEST: {
            state.loading = true;
            state.postDetail = null;
            state.err = null;
            return {...state}
        }
        case Type.GETDETAIL_SUCCESS:{
            state.loading = false;
            state.postDetail = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETDETAIL_FAILED:{
            state.loading = false;
            state.postDetail = null;
            state.err = action.data;
            return {...state}
        }
        case Type.GETOWNER_REQUEST: {
            state.loading = true;
            state.postOwner = null;
            state.err = null;
            return {...state}
        }
        case Type.GETOWNER_SUCCESS:{
            state.loading = false;
            state.postOwner = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETOWNER_FAILED:{
            state.loading = false;
            state.postOwner = null;
            state.err = action.data;
            return {...state}
        }
        
        case Type.GETAPPLICANTS_REQUEST: {
            state.loading = true;
            state.listApplicants = null;
            state.err = null;
            return {...state}
        }
        case Type.GETAPPLICANTS_SUCCESS:{
            state.loading = false;
            state.listApplicants = action.data;
            state.err = null;
            return {...state}
        }
        case Type.GETAPPLICANTS_FAILED:{
            state.loading = false;
            state.listApplicants = null;
            state.err = action.data;
            return {...state}
        }
        case Type.PAGE_INFO:{
            state.currentPage = action.data;
            return {...state}
        }
        default:
            return { ...state }
    }

}
export default PostJobReducer;