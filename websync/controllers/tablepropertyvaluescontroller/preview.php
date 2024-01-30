<?php Block::put('breadcrumb') ?>
    <ul>
        <li><a href="<?= Backend::url('tecnotrade/websync/tablepropertyvaluescontroller') ?>">TablePropertyValuesController</a></li>
        <li><?= e($this->pageTitle) ?></li>
    </ul>
<?php Block::endPut() ?>

<?php if (!$this->fatalError): ?>

    <div class="form-preview">
        <?= $this->formRenderPreview() ?>
    </div>

<?php else: ?>
    <p class="flash-message static error"><?= e($this->fatalError) ?></p>
<?php endif ?>

<p>
    <a href="<?= Backend::url('tecnotrade/websync/tablepropertyvaluescontroller') ?>" class="btn btn-default oc-icon-chevron-left">
        <?= e(trans('backend::lang.form.return_to_list')) ?>
    </a>
</p>