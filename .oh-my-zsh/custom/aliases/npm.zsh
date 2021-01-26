# npm
#	Scripts
alias ni="npm install"
alias nig="sudo npm install --global"
alias nis="npm install --save"
alias nxi="npx install"
alias ns="npm start"
alias nrs="npm run start"
#	Packages
alias nls="npm list"
alias nlsg="npm list --global"
#	@react
alias nrrd="nis react-router-dom"
alias nrpt="nis prop-types"

# Package specific
#	React
cra() {
	if [ -z $1 ]; then
		create-react-app .
	else
		create-react-app $1
	fi
}
rhoc() {
	if [ -z $1 ]; then
		mkdir -p hoc && touch hoc/Wrapper.jsx
	else
		mkdir -p hoc && touch hoc/$1.jsx
	fi
}
#	json-server
alias genjs="mkdir data && echo \"{\n\n}\" >> data/db.json"
jsons() {
	if [ -z $1 ]; then
		json-server --watch data/db.json --port 8000
	else
		json-server --serverwatch $1 --port 8000
	fi
}
jsonsp() {
	if [ -z $2 ]; then
		json-server --watch data/db.json --port $1
	else
		json-server --watch $1 --port $2
	fi
}
