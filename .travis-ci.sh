OPAM_DEPENDS="re ulex uri xmlm dyntype ounit omd"

case "$OCAML_VERSION,$OPAM_VERSION" in
3.12.1,1.0.0) ppa=avsm/ocaml312+opam10 ;;
3.12.1,1.1.0) ppa=avsm/ocaml312+opam11 ;;
4.00.1,1.0.0) ppa=avsm/ocaml40+opam10 ;;
4.00.1,1.1.0) ppa=avsm/ocaml40+opam11 ;;
4.01.0,1.0.0) ppa=avsm/ocaml41+opam10 ;;
4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam
export OPAMYES=1
export OPAMVERBOSE=1
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version

opam init
## opam.ocamlpro.org appears to be default repo but appears to be having issues
## at the moment, so change it. but it's version of opam.1.0.0 is broken, so
## don't change if that's the test.
case "$OPAM_VERSION" in
    1.1.0)
        opam remote remove default
        opam remote add default http://opam.ocaml.org
        opam update -u
        ;;
    *)
        echo "using default..."
        opam remote
        ;;
esac

opam install ${OPAM_DEPENDS}

eval `opam config env`
make
cd tests && make
