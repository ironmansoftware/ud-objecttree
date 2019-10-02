import React from 'react';
import JSONTree from 'react-json-tree';

export default class UDObjectTree extends React.Component {

  render() {
    return <JSONTree data={this.props.object} />
  }
}