; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude my_message.msg.html

(cl:defclass <my_message> (roslisp-msg-protocol:ros-message)
  ((Raimondo
    :reader Raimondo
    :initarg :Raimondo
    :type cl:string
    :initform "")
   (Morga
    :reader Morga
    :initarg :Morga
    :type cl:string
    :initform "")
   (eta
    :reader eta
    :initarg :eta
    :type cl:integer
    :initform 0)
   (voto
    :reader voto
    :initarg :voto
    :type cl:float
    :initform 0.0))
)

(cl:defclass my_message (<my_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<my_message> is deprecated: use beginner_tutorials-msg:my_message instead.")))

(cl:ensure-generic-function 'Raimondo-val :lambda-list '(m))
(cl:defmethod Raimondo-val ((m <my_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:Raimondo-val is deprecated.  Use beginner_tutorials-msg:Raimondo instead.")
  (Raimondo m))

(cl:ensure-generic-function 'Morga-val :lambda-list '(m))
(cl:defmethod Morga-val ((m <my_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:Morga-val is deprecated.  Use beginner_tutorials-msg:Morga instead.")
  (Morga m))

(cl:ensure-generic-function 'eta-val :lambda-list '(m))
(cl:defmethod eta-val ((m <my_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:eta-val is deprecated.  Use beginner_tutorials-msg:eta instead.")
  (eta m))

(cl:ensure-generic-function 'voto-val :lambda-list '(m))
(cl:defmethod voto-val ((m <my_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:voto-val is deprecated.  Use beginner_tutorials-msg:voto instead.")
  (voto m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_message>) ostream)
  "Serializes a message object of type '<my_message>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'Raimondo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'Raimondo))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'Morga))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'Morga))
  (cl:let* ((signed (cl:slot-value msg 'eta)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'voto))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_message>) istream)
  "Deserializes a message object of type '<my_message>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Raimondo) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'Raimondo) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Morga) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'Morga) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'eta) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'voto) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_message>)))
  "Returns string type for a message object of type '<my_message>"
  "beginner_tutorials/my_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_message)))
  "Returns string type for a message object of type 'my_message"
  "beginner_tutorials/my_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_message>)))
  "Returns md5sum for a message object of type '<my_message>"
  "583fc403537dae1c9c78ff963804876f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_message)))
  "Returns md5sum for a message object of type 'my_message"
  "583fc403537dae1c9c78ff963804876f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_message>)))
  "Returns full string definition for message of type '<my_message>"
  (cl:format cl:nil "string Raimondo~%string Morga~%int32 eta~%float32 voto~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_message)))
  "Returns full string definition for message of type 'my_message"
  (cl:format cl:nil "string Raimondo~%string Morga~%int32 eta~%float32 voto~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_message>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'Raimondo))
     4 (cl:length (cl:slot-value msg 'Morga))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_message>))
  "Converts a ROS message object to a list"
  (cl:list 'my_message
    (cl:cons ':Raimondo (Raimondo msg))
    (cl:cons ':Morga (Morga msg))
    (cl:cons ':eta (eta msg))
    (cl:cons ':voto (voto msg))
))
