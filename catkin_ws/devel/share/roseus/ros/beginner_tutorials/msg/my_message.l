;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::my_message)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'my_message (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::MY_MESSAGE")
  (make-package "BEGINNER_TUTORIALS::MY_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude my_message.msg.html


(defclass beginner_tutorials::my_message
  :super ros::object
  :slots (_Raimondo _Morga _eta _voto ))

(defmethod beginner_tutorials::my_message
  (:init
   (&key
    ((:Raimondo __Raimondo) "")
    ((:Morga __Morga) "")
    ((:eta __eta) 0)
    ((:voto __voto) 0.0)
    )
   (send-super :init)
   (setq _Raimondo (string __Raimondo))
   (setq _Morga (string __Morga))
   (setq _eta (round __eta))
   (setq _voto (float __voto))
   self)
  (:Raimondo
   (&optional __Raimondo)
   (if __Raimondo (setq _Raimondo __Raimondo)) _Raimondo)
  (:Morga
   (&optional __Morga)
   (if __Morga (setq _Morga __Morga)) _Morga)
  (:eta
   (&optional __eta)
   (if __eta (setq _eta __eta)) _eta)
  (:voto
   (&optional __voto)
   (if __voto (setq _voto __voto)) _voto)
  (:serialization-length
   ()
   (+
    ;; string _Raimondo
    4 (length _Raimondo)
    ;; string _Morga
    4 (length _Morga)
    ;; int32 _eta
    4
    ;; float32 _voto
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _Raimondo
       (write-long (length _Raimondo) s) (princ _Raimondo s)
     ;; string _Morga
       (write-long (length _Morga) s) (princ _Morga s)
     ;; int32 _eta
       (write-long _eta s)
     ;; float32 _voto
       (sys::poke _voto (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _Raimondo
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Raimondo (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _Morga
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Morga (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _eta
     (setq _eta (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _voto
     (setq _voto (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get beginner_tutorials::my_message :md5sum-) "583fc403537dae1c9c78ff963804876f")
(setf (get beginner_tutorials::my_message :datatype-) "beginner_tutorials/my_message")
(setf (get beginner_tutorials::my_message :definition-)
      "string Raimondo
string Morga
int32 eta
float32 voto

")



(provide :beginner_tutorials/my_message "583fc403537dae1c9c78ff963804876f")


