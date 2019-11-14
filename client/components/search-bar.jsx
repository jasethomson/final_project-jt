import React from "react";

class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSearch(event) {
    event.preventDefault();
    this.props.setView("searchBarResultsList", null, this.state.value);
  }

  render() {
    return (
      <div className="searchBarContainer rounded-circle textFont">
        <form className="searchBarForm" onSubmit={this.handleSearch}>
          <input
            className="searchbar"
            type="search"
            value={this.state.value}
            placeholder=" Search"
            onChange={this.handleChange}/>
          {<button><img className="searchIcon mx-1 mb-2" src="./image/searchIcon.png" alt="searchPicture" onClick={e => this.handleSearch(e)} /></button>}
        </form>
      </div>
    );
  }
}

export default SearchBar;
