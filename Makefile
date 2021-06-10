conda_env:
	conda env create --name=more-map-and-call --file=enc.yaml

# A phony target. Any target that isn't a file.
# It will never be up to date so make will always try to run it.
clean:
	rm file*.txt

