import React from 'react';
import JSONTree from 'react-json-tree';

export default class UDObjectTree extends React.Component {

  render() {
    return this.props.isJson ? <JSONTree data={JSON.parse(this.props.object)} /> : <JSONTree data={this.props.object} />
  }
}