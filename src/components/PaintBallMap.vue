<template>
  <div class="paintball-map">
    <div class="perms" v-if="askPerms">
      <svg class="site-logo" viewBox="0 0 491 380" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0 0H49V131C49 135.418 45.4183 139 41 139H8C3.58172 139 0 135.418 0 131V0Z" transform="translate(186 218)" fill="#9B9B9B"/>
        <path d="M0 8C0 3.58172 3.58172 0 8 0H124V36H8C3.58172 36 0 32.4183 0 28V8Z" transform="translate(0 147)" fill="#9B9B9B"/>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 0C3.58172 0 0 3.58172 0 8V62C0 66.4183 3.58173 70 8 70H308V69.986C308.332 69.9953 308.666 70 309 70C328.33 70 344 54.33 344 35C344 15.67 328.33 0 309 0C308.666 0 308.332 0.00468445 308 0.0140076V0H8Z" transform="translate(147 131)" fill="#9B9B9B"/>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M111 99.9115V100H50H49V99.9902C21.8473 99.4575 0 77.2801 0 50C0 22.7199 21.8473 0.542465 49 0.00979614V0H50H111V0.0885162C111.992 0.0297852 112.993 0 114 0C141.614 0 164 22.3858 164 50C164 77.6142 141.614 100 114 100C112.993 100 111.992 99.9702 111 99.9115Z" transform="translate(168)" fill="#9B9B9B"/>
        <rect width="22" height="31" transform="translate(239 100)" fill="#9B9B9B"/>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M174 69C162 28.5001 174 5.5 182.5 0H63.5C63.5 0 63.5 6 51 24L51.6602 24.4801C50.6111 26.062 50 27.9596 50 30C50 35.5228 54.4771 40 60 40C64.6571 40 68.5706 36.8165 69.6832 32.5069L80 16L94 62L52.7584 60.5061C40 59 39 48 39 48L22 0H0L18.0867 55.5061C18.0867 55.5061 26 72.5 40 80L102 88L109.327 111.273L120.536 153.109C121.68 157.376 126.067 159.909 130.334 158.766L186.106 143.822C190.373 142.678 192.906 138.291 191.763 134.024L176.751 78L176.191 78.1502C174.876 72.6244 174 69 174 69Z" transform="translate(272 220)" fill="#9B9B9B"/>
      </svg>
      <h2 class="site-title">{{title}}</h2>
      <p>Allow Camera Access?</p>
      <input type='checkbox' id="allow_camera" @change="allowCameraPerm()">
      <label for='allow_camera'></label>
    </div>
    <div class="ar-scene" v-if="allowAR">
      <div class="target" @click="hitRecieved">

      </div>
      <a-scene embedded arjs='trackingMethod: best;' v-pre>
        <anchor hit-testing-enabled='true' v-pre>
          <a-box color="red" position="0 2 -5" rotation="0 45 45" scale="2 2 2" v-pre></a-box>
        </anchor>
        <a-entity camera gps-position compass-rotation v-pre></a-entity>
      </a-scene>
    </div>
    <hr v-if="askPerms">
    <button type="button" v-if="askPerms" @click="changeLayout(true)">Load AR</button>
  </div>
</template>

<script>

export default {
  name: 'PaintBallMap',
  props: {
    title: String
  },
  data: function () {
    return {
      askPerms: true,
      allowAR: false,
      allowCamera: false
    }
  },
  methods: {
    changeLayout: function (layout) {
      this.askPerms = false;
      this.allowAR = layout
    },
    allowCameraPerm: function () {
      let self = this;
      // eslint-disable-next-line
      console.log({
        allowCamera: this.allowCamera,
        self: self
      })
      if (this.allowCamera) {
        this.allowCamera = false;
        return false;
      }
      let getCamera = navigator.mediaDevices.getUserMedia || navigator.getUserMedia || 0;
      if (!getCamera) {
        alert('Sorry, your browser does not support getUserMedia');
        return false;
      }
      // Request the camera.
      // eslint-disable-next-line
      navigator.getUserMedia(
        // Constraints
        {
          video: true
        },
        // Success Callback
        function(localMediaStream) {
          self.allowCamera = true;
          // eslint-disable-next-line
          console.log({
            localMediaStream: localMediaStream,
            selfAllowCamera: self.allowCamera
          });
        },
        // Error Callback
        function(err) {
          self.allowCamera = false;
          // Log the error to the console.
          // eslint-disable-next-line
          console.warn('The following error occurred when trying to use getUserMedia: ' + err);
        }
      );
    },
    hitRecieved: function () {
      console.log({
        hitRecieved: true
      });
      window.navigator.vibrate([200, 100, 200]);
    }
  }
}
</script>

<style lang="scss" scoped>
  .perms {
    margin-bottom: 3em;
  }
  hr {
    margin-bottom: 2em;
  }
  #allow_camera {
    display: none;
    &:checked + label {
      background: #2EC4B6;
      &:after {
        transform: translate(100%, 0);
      }
    }
  }
  label[for='allow_camera'] {
    display: block;
    width: 100px;
    height: 50px;
    border-radius: 50px;
    position: relative;
    transition: 0.15s ease-in-out;
    background: rgb(255, 70, 92);
    margin: 0 auto;
    &:after {
      content: '';
      display: block;
      widtH: 50px;
      heighT: 50px;
      border-radius: 50px;
      box-shadow: 0px 1px 10px rgba(black, 0.35);
      background: white;
      transition: 0.15s ease-in-out;
    }
  }
  button {
    font-size: 20px;
    display: block;
    border: none;
    color: #fff;
    background-color: hsla(248, 100%, 76%, 1);
    border-radius: 6px;
    margin: 0 auto .5em;
    padding: .5em 1em;
    box-shadow: 4px 4px 0px #000;
    transition: .25s;
  }
  button:hover {
    box-shadow: 2px 2px 0px #000;
  }
  .ar-scene {
    position: relative;
  }
  .target {
    position: absolute;
    top: 50vh;
    left: 50vw;
    width: 100px;
    height: 100px;
    background-color: rgb(45, 206, 255);
    border-radius: 50%;
    transform: translate3d(-50%, -50%, 0);
    cursor: crosshair;
    &:active:after {
      transform: scale(.75);
    }
    &:after {
      position: absolute;
      top: 0;
      left: 0;
      content: '';
      width: 100%;
      height: 100%;
      background-color: #2effea;
      border-radius: 50%;
      transform: scale(.5);
      transition: transform .25s;
    }
  }
</style>
