import React from "react";
import SearchBarResultsItem from "./search-bar-results-item";
import Header from './header';
import SearchBar from './search-bar';

class SearchBarResultsList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      list: [],
      // value: ""
    };
  }
  // componentDidMount() {
  //  this.getRecipes();
  // }

  // loadResults() {
  //   this.setState({ list: this.props.results });
  // }
  handleClick(props) {
    props.setView("home", {}, []);
  }

  componentDidMount(){
    fetch( `/api/test.php?q=` + this.props.value )
      .then(response => response.json())
      .then(recipes => {
        console.log("recipes are:", recipes)
        this.setState({ list: recipes });
      });
      // .then(() => {
      //   this.props.setView("search bar result",{}, this.state.list);
      // });
  }
  componentDidUpdate(prevProps){
    if (prevProps.value === this.props.value){
      return;//if the search term is the same as the last search term, then end fecth call
      //if it's different term, then fetch again to end the cycle. 
    }
    fetch( `/api/test.php?q=` + this.props.value )
      .then(response => response.json())
      .then(recipes => {
        console.log("recipes are:", recipes)
        this.setState({ list: recipes });
      })
      // .then(() => {
      //   this.props.setView("search bar result",{}, this.state.list);
      // });
  }
  render() {
    return (
        <div>
          <a onClick={() => this.handleClick(this.props)}>Home</a>
          <div>
            <SearchBar setView={this.props.setView}/>
        </div>
        <div>
          <h4>Search Results</h4>
          <Header setView={this.props.setView}/>
          <section className="section">
              <div className="row">
              {this.state.list.map((recipe, x) => {
                if (x < 5) {
                  return (
                      <SearchBarResultsItem
                        key={x}
                        name={recipe.label}
                        image={recipe.image}
                        url={recipe.directions_url}
                        servingSize={recipe.serving_size}
                        ingredient={recipe.ingredientLines}
                        time={recipe.totalTime}
                        setView={this.props.setView}
                        recipe={recipe}
                      />
                  );
                }
              })}
            </div>
          </section>
        </div>
        </div>
      );
    }
}

export default SearchBarResultsList;