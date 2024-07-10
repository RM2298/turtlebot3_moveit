// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class my_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Raimondo = null;
      this.Morga = null;
      this.eta = null;
      this.voto = null;
    }
    else {
      if (initObj.hasOwnProperty('Raimondo')) {
        this.Raimondo = initObj.Raimondo
      }
      else {
        this.Raimondo = '';
      }
      if (initObj.hasOwnProperty('Morga')) {
        this.Morga = initObj.Morga
      }
      else {
        this.Morga = '';
      }
      if (initObj.hasOwnProperty('eta')) {
        this.eta = initObj.eta
      }
      else {
        this.eta = 0;
      }
      if (initObj.hasOwnProperty('voto')) {
        this.voto = initObj.voto
      }
      else {
        this.voto = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type my_message
    // Serialize message field [Raimondo]
    bufferOffset = _serializer.string(obj.Raimondo, buffer, bufferOffset);
    // Serialize message field [Morga]
    bufferOffset = _serializer.string(obj.Morga, buffer, bufferOffset);
    // Serialize message field [eta]
    bufferOffset = _serializer.int32(obj.eta, buffer, bufferOffset);
    // Serialize message field [voto]
    bufferOffset = _serializer.float32(obj.voto, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type my_message
    let len;
    let data = new my_message(null);
    // Deserialize message field [Raimondo]
    data.Raimondo = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [Morga]
    data.Morga = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [eta]
    data.eta = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [voto]
    data.voto = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Raimondo);
    length += _getByteLength(object.Morga);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/my_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '583fc403537dae1c9c78ff963804876f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string Raimondo
    string Morga
    int32 eta
    float32 voto
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new my_message(null);
    if (msg.Raimondo !== undefined) {
      resolved.Raimondo = msg.Raimondo;
    }
    else {
      resolved.Raimondo = ''
    }

    if (msg.Morga !== undefined) {
      resolved.Morga = msg.Morga;
    }
    else {
      resolved.Morga = ''
    }

    if (msg.eta !== undefined) {
      resolved.eta = msg.eta;
    }
    else {
      resolved.eta = 0
    }

    if (msg.voto !== undefined) {
      resolved.voto = msg.voto;
    }
    else {
      resolved.voto = 0.0
    }

    return resolved;
    }
};

module.exports = my_message;
