# Learn JS in Jupyter

📙 Your interactive learning notebook for JavaScript ES6 / Python 3 / Python 2 \
Powered by Awesome [JupyterLab][jupyterlab] and docker 🐳 . Fun to use; Easy to install 👩‍💻 👨‍💻.

<br/>
<br/>

![demo-1][demo-1]


### Run Online with [_Play With Docker_][pwd-link] in 5 min (free)

1. Click [![Try in PWD][try-pwd-img]][try-pwd-link] to launch a new container. \
  After the stack builder is finished, close the dialog.

  - ![pwd-run-1][pwd-run-1]

2. Get Access Token by running this command in the terminal prompt:

  ```sh
  docker exec $(docker container list | awk 'FNR==2{print $1}') sh -c 'jupyter notebook list' \
    | awk 'FNR==2{print $1}' | grep -E 'token=(.*)' -o | cut -c7-54
  ```

3. Click the link above to access Jupyter page:

  - ![pwd-run-2][pwd-run-2]

4. In page paste the token in the input field to login

  - ![pwd-run-3][pwd-run-3]

5. 🎉 Congrats! Now you can create a Notebook with JavaScript, Python 3 or Python 2 Environment! \
  Type some code and press `shift` + `enter` to run it!

  - ![pwd-run-4][pwd-run-4]
  - ![pwd-run-5][pwd-run-5]


### Running Locally with Docker

1. Run Following command in your terminal:

  ```bash
  docker run -d -p 8888:8888 liuderchi/learn-js-in-jupyter:latest
  ```

2. Run following command to get Jupyter token. Then Copy it.

  ```bash
  docker exec $(docker container list | awk 'FNR==2{print $1}') sh -c 'jupyter notebook list' \
      | awk 'FNR==2{print $1}' | grep -E 'token=(.*)' -o | cut -c7-54
  ```

3. In browser go to `localhost:8888?token=PASTE_JUPYTER_TOKEN_HERE`


> Alternatively, use this One Liner for step 2 and step 3:
> ```bash
> python -mwebbrowser $(docker exec $(docker container list | awk 'FNR==2{print $1}') sh -c 'jupyter notebook list' | awk 'FNR==2{print $1}')
> ```

### Running and Saving Changes Locally

```sh
$ git clone https://github.com/liuderchi/learn-js-in-jupyter.git
$ cd learn-js-in-jupyter
$ docker run -d -p 8888:8888 \
  -v $PWD/notebooks:/root/learn-js-in-jupyter \
  -v $PWD/jupyterlab-settings:/root/.jupyter/lab/user-settings/@jupyterlab \
  liuderchi/learn-js-in-jupyter:latest

# open in browser with token in url
$ python -mwebbrowser $(docker exec $(docker container list | awk 'FNR==2{print $1}') \
  sh -c 'jupyter notebook list' | awk 'FNR==2{print $1}')
```


## License

[MIT License][mit-license]


[jupyterlab]: https://jupyterlab.readthedocs.io/en/stable/
[demo-1]: https://user-images.githubusercontent.com/4994705/44629391-3a5f4e80-a981-11e8-8f6c-924c778c00d8.png
[pwd-link]: https://labs.play-with-docker.com/
[try-pwd-img]: https://cdn.rawgit.com/play-with-docker/stacks/cff22438/assets/images/button.png
[try-pwd-link]: http://play-with-docker.com?stack=https://raw.githubusercontent.com/liuderchi/learn-js-in-jupyter/master/stack.yml
[pwd-run-1]: https://user-images.githubusercontent.com/4994705/44618078-d87be780-a8a1-11e8-9226-7f36616f90cc.png
[pwd-run-2]: https://user-images.githubusercontent.com/4994705/42303031-6e6cbebe-8051-11e8-8dea-928481c0f4e4.png
[pwd-run-3]: https://user-images.githubusercontent.com/4994705/44618015-c51c4c80-a8a0-11e8-903a-5627ee53a153.png
[pwd-run-4]: https://user-images.githubusercontent.com/4994705/44621173-e8142400-a8d3-11e8-9d1f-01abc34e3064.png
[pwd-run-5]: https://user-images.githubusercontent.com/4994705/44629393-3b907b80-a981-11e8-8131-cf0a64eaf11c.png
[mit-license]: https://liuderchi.mit-license.org/ 'mit-license'
