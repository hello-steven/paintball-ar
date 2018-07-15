<template>
  <div class="paintball-map">
    <div class="perms" v-if="askPerms">
      <p>Allow Camera Access?</p>
      <input type='checkbox' id="allow_camera" @change="allowCameraPerm">
      <label for='allow_camera'></label>
    </div>
    <a-scene embedded arjs v-if="allowAR">
      <a-marker preset="hiro">
        <a-box position='0 0.5 0' material='color: black;'></a-box>
      </a-marker>
      <a-entity camera></a-entity>
    </a-scene>
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
      let getCamera = navigator.mediaDevices.getUserMedia || navigator.getUserMedia || 0;
      if (!getCamera) {
        alert('Sorry, your browser does not support getUserMedia');
        return false
      }
      // Request the camera.
      // eslint-disable-next-line
      let browserAllowCamera = this.allowCamera;
      navigator.getUserMedia(
        // Constraints
        {
          video: true
        },
        // Success Callback
        function(localMediaStream) {
          // eslint-disable-next-line
          console.log({localMediaStream});
          browserAllowCamera = true;
        },
        // Error Callback
        function(err) {
          browserAllowCamera = false;
          // Log the error to the console.
          // eslint-disable-next-line
          console.warn('The following error occurred when trying to use getUserMedia: ' + err);
        }
      );
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
</style>
