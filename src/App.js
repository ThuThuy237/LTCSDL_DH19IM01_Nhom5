import './App.css';
import Login from './Pages/Login';
import Register from './Pages/Register';
import RegisterRecruiter from './Pages/RegisterRecruiter';
import 'antd/dist/antd.css';
import HomeTemplate from './Templates/HomeTemplate';
import Forbidden from './Components/Forbidden';
import UserTemplate from './Templates/UserTemplate';
import RecruiterTemplate from './Templates/RecruiterTemplate';
import {BrowserRouter , Route, Switch} from 'react-router-dom';
import { routesHome, routesRecruiter, routesUser } from './routers';

function App() {
  const showLayoutHome = (routes) => {
    if (routes && routes.length > 0) {
      return routes.map((item, index) => {
        return <HomeTemplate key={index} exact={item.exact} path={item.path} Component={item.component} />
      });
    }
  }
  const showLayoutUser = (routes) => {
    if (routes && routes.length > 0) {
      return routes.map((item, index) => {
        return <UserTemplate key={index} exact={item.exact} path={item.path} Component={item.component} />
      });
    }
  }
  const showLayoutRecruiter = (routes) => {
    if (routes && routes.length > 0) {
      return routes.map((item, index) => {
        return <RecruiterTemplate key={index} exact={item.exact} path={item.path} Component={item.component} />
      });
    }
  }
  return (
    <BrowserRouter>
      <Switch>
        {showLayoutHome(routesHome)}
        {showLayoutUser(routesUser)}
        {showLayoutRecruiter(routesRecruiter)}
        <Route path="/login" exact component={Login} />
        {/* <Route path="/user/:id" exact component={User} /> */}
        <Route path="/register" exact component={Register} />
        <Route path="/r-register" exact component={RegisterRecruiter} />
        <Route component={Forbidden} />
      </Switch>
    </BrowserRouter>
  );
}

export default App;
