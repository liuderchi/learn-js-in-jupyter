# Learn JS in Jupyter

An interactive JS notebook powered by [`jupyter-nodejs`][jupyter-nodejs-link]


## Getting Started

### Running Online with [_Play With Docker_][pwd-link]

1. Click [![Try in PWD][try-pwd-img]][try-pwd-link] to launch a new container. After the stack builder is finished, close the dialog.

2. Get Access Token by running shell command in the terminal prompt:

  ```sh
  # print jupyter token
  $ docker logs $(docker container list | awk 'FNR==2{print $1}') 2>&1 | grep -E 'token=(.*)' -o | cut -c7-54
  ```

3. Click the link above to access Jupyter page:

![pwd-demo][pwd-demo]

4. Paste the token to the input to login

### Running Locally with Docker

```sh
$ git clone https://github.com/liuderchi/learn-js-in-jupyter.git
$ cd learn-js-in-jupyter
$ docker run -d -p 8888:8888 -v $PWD/notebooks:/root/notebooks --name learn-js-in-jupyter liuderchi/jupyter-nodejs:latest
# print jupyter token
$ docker logs learn-js-in-jupyter 2>&1 | grep -E 'token=(.*)' -o | cut -c7-54
```

in browser go to `localhost:8888?token=PASTE_JUPYTER_TOKEN_HERE`


## License

[MIT License][mit-license]


[jupyter-nodejs-link]: https://github.com/notablemind/jupyter-nodejs
[pwd-link]: https://labs.play-with-docker.com/
[try-pwd-img]: https://cdn.rawgit.com/play-with-docker/stacks/cff22438/assets/images/button.png
[try-pwd-link]: http://play-with-docker.com?stack=https://raw.githubusercontent.com/liuderchi/learn-js-in-jupyter/master/stack.yml
[pwd-demo]: https://user-images.githubusercontent.com/4994705/42303031-6e6cbebe-8051-11e8-8dea-928481c0f4e4.png

[mit-license]: https://liuderchi.mit-license.org/ "mit-license"
