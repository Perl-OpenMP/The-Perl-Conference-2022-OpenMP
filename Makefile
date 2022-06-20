all: pi pi2 hi

hi:
	mkdir ./bin > /dev/null 2>&1 || echo found ./bin 
	gcc -fopenmp ./src/hello.c -o ./bin/hello.x

sections:
	mkdir ./bin > /dev/null 2>&1 || echo found ./bin 
	gcc -fopenmp ./src/sections.c -o ./bin/sections.x

critical:
	mkdir ./bin > /dev/null 2>&1 || echo found ./bin 
	gcc -fopenmp ./src/critical-pipeline.c -o ./bin/pipeline.x

pi:
	mkdir ./bin > /dev/null 2>&1 || echo found ./bin 
	gcc -fopenmp ./src/omp-pi.c -o ./bin/omp-pi.x

pi2:
	gcc -fopenmp ./src/omp-pi-2.c -o ./bin/omp-pi-2.x

run: pi2
	mkdir ./bin > /dev/null 2>&1 || echo found ./bin 
	./scripts/pi.sh
	./scripts/pi.pl
	./inline/omp-pi-2.pl
	./inline/omp-pi-3.pl
	./inline/omp-pi.pl

clean:
	rm -rvf ./bin/*.x ./_Inline
