build:
	docker build -t quay.io/actcat/devon_rex_go:dev .

test:
	docker run -it --rm quay.io/actcat/devon_rex_go:dev bash -c "go version"
