EXCLUDES = .DS_Store .git .gitignore .gitmodules

all:
	@$(foreach val, $(filter-out $(EXCLUDES), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean:
	@$(foreach val, $(filter-out $(EXCLUDES), $(wildcard .??*)), unlink $(HOME)/$(val);)
