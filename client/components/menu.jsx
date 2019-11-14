import React from "react";

class Menu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showMenu: false
    };
    this.setMenu = this.setMenu.bind(this);
  }

  setMenu() {
    this.setState({ showMenu: !this.state.showMenu })
  };

  render() {
    const containerOpacity = {
      backgroundColor: "rgb(0, 0, 0, 0.4)",
    };

    const menuDivOpacity = {
      backgroundColor: "rgb(255,255,255)",
    }

    const greyDivOpacity = {
      opacity: "0.5"
    }

    const menuStyle = "border border-dark modal-body py-0 px-0"
    const menuTextStyle ="pl-2 py-4 font-weight-bold"

    if (!this.state.showMenu) {
      return <i className="col-1 fas fa-bars headerTextMenu headerMenuSize d-flex align-self-center justify-content-end fa-lg" onClick={this.setMenu}></i>
    } else {
      return (
        <div className="col wrapper headerMenuSize textFont">
          <nav className=" d-flex column modal py-0 px-0 d-inline-block" style={containerOpacity}>
            <div id="shadedMenu" className={menuStyle} style={greyDivOpacity} onClick={this.setMenu}></div>
            <div id="nonShadedMenu" className={menuStyle} style={menuDivOpacity}>
              <div className={menuTextStyle} onClick={
                () => { this.props.setView("home", {});
                this.setMenu();}}>Home</div>
              <div className={menuTextStyle} onClick={
                () => { this.props.setView("recipes", {});
                this.setMenu();}}>Recipes</div>
              <div className={menuTextStyle} onClick={
                () => { this.props.setView("calendar", {});
                this.setMenu();}}>Calendar</div>
              <div className={menuTextStyle} onClick={
                () => { this.props.setView("shoppingList", {});
                this.setMenu();}}>Shopping List</div>
            </div>
          </nav>
        </div>
      )
    }
  }


}

export default Menu;
