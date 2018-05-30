import React from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({searchTerm: event.target.value});
  }
  
  handleSubmit(event){ 
    event.preventDefault();
    const searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
    this.setState({searchTerm: ''});
  }

  render() {
    return(
      <div>
        <h1>Search for Giphys!</h1>
        <div>
          <input onChange={this.handleChange} type="text" value={this.state.searchTerm}/>
          <input onClick={this.handleSubmit} type="submit" value="Search Giphy!"/>
        </div>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}