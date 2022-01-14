import Home from '../Pages/Home';
import About from '../Pages/About';
import Contact from '../Pages/Contact';
import FindJob from '../Pages/FindJob';
import PostDetail from '../Pages/PostDetail';
import CompanyDetails from '../Pages/CompanyDetail';
import CompanyReview from '../Pages/CompanyReview';
// import User from '../Pages/User/User';
import InfoUser from '../Pages/User/InfoUser';
import ChangePassword from '../Pages/User/ChangePassword';
import JobApplications from '../Pages/User/JobApplication';
import Applied from '../Pages/User/Applied';
import CompanyInfo from '../Pages/Recruiter/CompanyInfo';
import PostedJobs from '../Pages/Recruiter/PostedJobs';
import CreatePost from '../Pages/Recruiter/CreatePost';
import ManagePost from '../Pages/Recruiter/ManagePost';

const routesHome = [
    {
        exact: true,
        path: "/",
        component: Home,
    },
    {
        exact: false,
        path: "/home",
        component: Home,
    },
    {
        exact: false,
        path: "/about",
        component: About,
    },
    {
        exact: false,
        path: "/contact",
        component: Contact,
    },
    {
        exact: false,
        path: "/find-job",
        component: FindJob,
    },
    {
        exact: false,
        path: "/company-review",
        component: CompanyReview,
    },
    {
        exact: false,
        path: "/post/:id",
        component: PostDetail,
    },
    {
        exact: false,
        path: "/company/:id",
        component: CompanyDetails,
    },
];
const routesUser = [
    {
        exact: true,
        path: "/user",
        component: InfoUser,
    },
    {
        exact: false,
        path: "/user/info",
        component: InfoUser,
    },
    {
        exact: false,
        path: "/user/change-password",
        component: ChangePassword,
    },
    {
        exact: false,
        path: "/user/job-applications",
        component: JobApplications,
    },
    {
        exact: false,
        path: "/user/applied",
        component: Applied,
    },
];
const routesRecruiter = [
    {
        exact: true,
        path: "/recruiter",
        component: InfoUser,
    },
    {
        exact: false,
        path: "/recruiter/info",
        component: InfoUser,
    },
    {
        exact: false,
        path: "/recruiter/change-password",
        component: ChangePassword,
    },
    {
        exact: false,
        path: "/recruiter/company-info",
        component: CompanyInfo,
    },
    {
        exact: false,
        path: "/recruiter/posted-jobs",
        component: PostedJobs,
    },
    {
        exact: false,
        path: "/recruiter/create",
        component: CreatePost,
    },
    
    {
        exact: false,
        path: "/recruiter/managePost/:id",
        component: ManagePost,
    },
];
export { routesHome, routesUser, routesRecruiter };